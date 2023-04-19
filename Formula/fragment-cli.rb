require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.19-1-darwin-x64.tar.gz"
    sha256 "ea9051dad9510bdf85bd152d6371c14248a6331e4b3349ef8dd1b38029938fc5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.19-1-darwin-arm64.tar.gz"
      sha256 "aea6861c49f665124f4f04e08856907060e5d9fdc85bd1c49c5048c4396cb718"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.19-1-linux-x64.tar.gz"
    sha256 "0c4f224861ad97177b984e121dde994d5d769176ccd471315ef6d95b5b64f9a9"
  end
  version "2023.4.19-1"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
