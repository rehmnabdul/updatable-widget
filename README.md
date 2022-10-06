# Updatable Widget
This widget will help any flutter component update automatically.


### Implementation
You can use this widget like this:

> 1. Create controller for the widget

    
    final myController = UpdatableWidgetController<dynamic>();

**_or_**

    final myController = UpdatableWidgetController<String>("Test");

> 2. Create Widget:

    UpdatableWidget<String>(
        controller: myController,
        createWidget: (BuildContext context, String data) {
            //Now you can cast data object to your desired object
            MyObject response = data as MyObject;
            return Container();
        }
    )
> 3. Update Widget:

When app is running and displaying UI then you can dynamically set data to the controller by this code snippet

    controller.setValue( **Your Data Object** );

When you call this method your widget will be re-draw on the screen. And only this part of screen will be updated.

> You can get rid of many complex implementation of Bloc or Provider etc form simple UI updates.