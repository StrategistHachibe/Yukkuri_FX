
-- �O���֐��F�g���A�j���[�V����
function ExAnimation()

	-- �֐��F����^�A�j���[�V�����̖�������������
	function TeikiAnimation(Bangou,Moji,Parts,Type,Kaishi,Kankaku,Jikan,Chukan)

		Matsubi = "" -- ������������

		-- ���V�Ɠ����w��ŁA���V���ĂȂ��ꍇ�́A�A�j���[�V�����Ȃ�
		if Jikan == 0 or Kankaku == 0 then
			if BaseFuyuudo <= 0 then return Matsubi end 
		end

		-- �}�[�N������ȊO���ɂ���ăt�H���_�p�X���ꍇ����
		if Parts == "�}�[�N" then
			FolderPass = CHARA_SOZAI.."������\\�}�[�N\\"
		else
			FolderPass = CHARA_SOZAI..CharaFolder..CN.."\\"..Parts.."\\"
		end

		-- �O�㔻�ʕ����̌���
		Zengo = ""
		FilePass = FolderPass..string.format("%02d",Bangou)..Moji.."01.png"
		if os.rename(FilePass,FilePass) == nil then
			for Count = 1,9 do
				FilePass = FolderPass..string.format("%02d",Bangou).."m"..Count..Moji.."01.png"
				if os.rename(FilePass,FilePass) ~= nil then
					Zengo = "m"..Count
					break
				end
				FilePass = FolderPass..string.format("%02d",Bangou).."u"..Count..Moji.."01.png"
				if os.rename(FilePass,FilePass) ~= nil then
					Zengo = "u"..Count
					break
				end
			end
		end

		-- ������������
		BunkatsuSuu = 0
		while 1 do
			FilePass = FolderPass..string.format("%02d",Bangou)..Zengo..Moji..string.format("%02d",BunkatsuSuu+1)..".png"
			if os.rename(FilePass,FilePass) == nil then break end
			BunkatsuSuu = BunkatsuSuu + 1
		end

		if BunkatsuSuu > 0 then

			if Type == "����" then

				if Parts == "�}�[�N" then

					-- �������Ԃ�ݒ�
					BunkatsuTime = Jikan/(2*BunkatsuSuu+Chukan)

					-- �]�莞�Ԃ�ݒ�
					AmariTime = ObjTime % Kankaku

				elseif Jikan == 0 or Kankaku == 0 then

					-- �������Ԃ�ݒ�
					BunkatsuTime = BaseFS/(2*BunkatsuSuu+Chukan)

					-- �]�莞�Ԃ�ݒ�
					AmariTime = (ObjTime + BaseFuyuuStart) % BaseFS

				else

					-- �������Ԃ�ݒ�
					BunkatsuTime = Jikan/(2*BunkatsuSuu+Chukan)

					-- �]�莞�Ԃ�ݒ�
					KaishiTime = (Kankaku * (BaseMS % BaseMK) / BaseMK + Kaishi + Kankaku) % Kankaku
					AmariTime = ObjTime % Kankaku - KaishiTime
				end

				-- �]�莞�Ԃ���A�̉摜������
				Count = 1
				while (Count-1)*BunkatsuTime <= AmariTime and Count <= (2*BunkatsuSuu+Chukan) + 1 do
					if Count <= BunkatsuSuu then
						Matsubi = Moji..string.format("%02d",Count)
					elseif Count <= BunkatsuSuu + Chukan then
						Matsubi = Moji..string.format("%02d",BunkatsuSuu)
					elseif Count <= 2*BunkatsuSuu + Chukan then
						Matsubi = Moji..string.format("%02d",(2*BunkatsuSuu+Chukan)-Count+1)
					else
						Matsubi = ""
					end
					Count = Count + 1
				end

			elseif Type == "�Г�" then

				if Parts == "�}�[�N" then

					-- �������Ԃ�ݒ�
					BunkatsuTime = Jikan/(2*BunkatsuSuu+Chukan)

					-- �]�莞�Ԃ�ݒ�
					AmariTime = ObjTime % Kankaku

				elseif Jikan == 0 or Kankaku == 0 then

					-- �������Ԃ�ݒ�
					BunkatsuTime = BaseFS/BunkatsuSuu

					-- �]�莞�Ԃ�ݒ�
					AmariTime = (ObjTime + BaseFuyuuStart) % BaseFS

				else

					-- �������Ԃ�ݒ�
					BunkatsuTime = Jikan/BunkatsuSuu

					-- �]�莞�Ԃ�ݒ�
					KaishiTime = (Kankaku * (BaseMS % BaseMK) / BaseMK + Kaishi + Kankaku) % Kankaku
					AmariTime = ObjTime % Kankaku - KaishiTime

				end

				-- �]�莞�Ԃ���A�摜������
				Count = 1
				while (Count-1)*BunkatsuTime <= AmariTime and Count <= BunkatsuSuu + 1 do
					if Count <= BunkatsuSuu then
						Matsubi = Moji..string.format("%02d",Count)
					else
						Matsubi = ""
					end
					Count = Count + 1
				end

			end

		end

		return Matsubi -- ������Ԃ�

	end

	-- �g���A�j���[�V�����p������̏�����
	KaoString = ""
	MayuString = ""
	KaradaString = ""
	HokaString = ""
	AryMaeKumiString = {"","","","","","","","","",""}
	AryUshiroKumiString = {"","","","","","","","","",""}
	MarkString = ""

	----------------------------------------------------------------------
	-- �g���A�j���[�V�����i�L�����I�u�W�F�N�g��p�j
	----------------------------------------------------------------------

	if CharaObjectFlag == 1 then 

		�y�g���A�j���[�V�����z

	end

	----------------------------------------------------------------------
	-- �}�[�N�̊g���A�j���[�V�����i�L�����I�u�W�F�N�g�ȊO���j
	----------------------------------------------------------------------

	�y�g���A�j���[�V�����i�}�[�N�j�z

end
