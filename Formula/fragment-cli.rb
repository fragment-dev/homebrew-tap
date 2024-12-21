require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.21-darwin-x64.tar.gz"
    sha256 "3928914b0dcf0beda8d72c1cb98d2c1017584a5600f7f0893a5e074c3349b171"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.21-darwin-arm64.tar.gz"
      sha256 "2d7fd899678ba5612411370bc952c684ef7e9ef5d8ced11e37f45c95f4f28a9c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.21-linux-x64.tar.gz"
    sha256 "a996670846c15b0491ed0b42a56933d3bb15ce973e10aca9dc6c907fddfa60e1"
  end
  version "2024.12.21"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
