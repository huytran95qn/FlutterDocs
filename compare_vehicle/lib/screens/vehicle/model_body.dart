import 'package:compare_vehicle/util/module.dart';
import 'package:flutter/material.dart';
import 'package:compare_vehicle/model/module.dart';
import 'package:compare_vehicle/services/api/api_service.dart';
import 'package:compare_vehicle/widget/module.dart';

class ModelBody extends StatefulWidget {
  const ModelBody({ Key key }) : super(key: key);

  @override
  _ModelBodyState createState() => _ModelBodyState();
}

class _ModelBodyState extends State<ModelBody> {
  final borderSide = BorderSide();
  final boldBorderSide = BorderSide(width: 2.0);
  final sizeModelGroup = 3;
  List<ModelGroups> modelGroups = ApiService.shared().sortProductByModelEnum();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildContent()
    );
  }

  List<Widget> _buildContent() {
    final chunkModelGroups = partition(modelGroups, sizeModelGroup).toList();
    List<Widget> _column = [];
    for (int i = 0; i < chunkModelGroups.length; i++) {
      final models = chunkModelGroups[i];
      final modelSelected = models.where((model) => model.isSelected == true);

      _column.add(
        Container(
          padding: EdgeInsets.only(top: 16),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ..._buildListModelItem(models, modelSelected.isNotEmpty),
            ],
          ),
        )
      );

      if(modelSelected.isNotEmpty) {
        _column.add(
          TTAnimationExpand(
            child: _buildTrimView(),
            hasExpand: modelSelected.isNotEmpty
          )
        );
      }
    }
    return _column;
  }

  List<Widget> _buildListModelItem(List<ModelGroups> models, bool hasModelSelected) {
    List<Widget> _rows = [];
    for (var i = 0; i < models.length; i++) {
      _rows.add(_buildModelItem(models[i], hasModelSelected));
      if(i < sizeModelGroup - 1 && hasModelSelected) {
        _rows.add(_buildDivider());
      }
    }
    return _rows;
  }

  Widget _buildModelItem(ModelGroups model, bool hasModelSelected) {
    final isActive = model.isSelected || !hasModelSelected;
    Border border = Border(bottom: hasModelSelected ? boldBorderSide : borderSide);
    if(model.isSelected) {
      border = Border();
    }
    return Container(
      height: 260,
      width: 300,
      decoration: BoxDecoration(border: border),
      child: Opacity(
        opacity: isActive ? 1 : 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              'https://cdn2.iconfinder.com/data/icons/sketchy-basic-icons/94/truck-512.png',
              height: 130,
            ),
            _buildModelInfo(model),
            _buildTrimSelected(model, hasModelSelected)
          ],
        )
      )
    );
  }

  Widget _buildModelInfo(ModelGroups model) {
    final st = TextStyle(color: Colors.black, fontFamily: 'HyundaiSansHead', fontSize: 18);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          height: 44,
          child: Text(model.modelDisplayName, style: st.copyWith(fontWeight: FontWeight.w500)),
        ),
        Container(
          child: Text.rich(
            TextSpan(
              text: 'From ',
              style: st.copyWith(fontSize: 16),
              children: [
                TextSpan(
                  text: 'Rp. ${model.products[0].fscDependencies[0].msrp}',
                  style: st.copyWith(fontWeight: FontWeight.w700),
                ),
              ]
            )
          ),
        ),
      ],
    );
  }

  Widget _buildTrimSelected(ModelGroups model, bool hasModelSelected) {
    final _textStyle = TextStyle(color: Colors.black, fontFamily: 'HyundaiSansHead', fontSize: 16);
    final _icon = model.isSelected ? Icons.arrow_downward : Icons.arrow_upward;
    Border _border = Border(
      top: model.isSelected ? boldBorderSide : borderSide,
      left: model.isSelected ? boldBorderSide : borderSide,
      right: model.isSelected ? boldBorderSide : borderSide,
    );
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(border: _border),
      child: FlatButton(
        onPressed: () {
          for (var i = 0; i < modelGroups.length; i++) {
            final item = modelGroups[i];
            if(model.modelEnum == item.modelEnum) {
              item.isSelected = !item.isSelected;
            } else {
              item.isSelected = false;
            }
          }
          setState(() {modelGroups = modelGroups;});
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 20),
            Text('Trim View', style: _textStyle),
            Spacer(),
            Icon(_icon),
            SizedBox(width: 20),
          ],
        ),
      )
    );
  }

  Widget _buildTrimView() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border(
          bottom: boldBorderSide,
          left: boldBorderSide,
          right: boldBorderSide,
        )
      )
    );
  }

  Widget _buildDivider() {
    return Expanded(
        child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: boldBorderSide
          )
        )
      )
    );
  }
}