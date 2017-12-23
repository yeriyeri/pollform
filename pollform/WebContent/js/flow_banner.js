jQuery(function() {

    $("#banner ul").carouFredSel({
        align : "left",
        width : 1100, // ���α���
        height : 50, // ���α���
        items : {
        visible : 6 // �������� ���� (5���� �������ٸ� +1�� �Ͽ� ���� ȿ���� ���´�.)
        },
        scroll : {
        items : 1, // �Ѹ��Ѿ�� ����
        duration : 550, //�Ѹ� �ӵ�
        pauseOnHover : false // ���콺 ������ �Ѹ����� true, �Ѹ��۵� false
        },
        next : "#banner_right", // ���������� �̵� ��ư
        prev : "#banner_left", // �������� �̵� ��ư
        direction : "left" // �Ѹ� ����
    });

    $("#banner_pause").click(function(){
        $("#banner ul").trigger("pause");
        $("#banner_stop").hide();
        $("#banner_start").show();
        return true;
    });

    $("#banner_play").click(function(){
        $("#banner ul").trigger("play", 1);
        $("#banner_stop").show();
        $("#banner_start").hide();
        return true;
    });

});