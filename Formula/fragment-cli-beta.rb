require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2284.0.0-darwin-x64.tar.gz"
    sha256 "026485a00a2010fec5366ceb5e97d16a0328210481fae7765c0ca6e487cf4e41"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2284.0.0-darwin-arm64.tar.gz"
      sha256 "39ba4a2493bcbf022752fbc3325e8c839dc31ed936004f66659389e4b24f4627"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2284.0.0-linux-x64.tar.gz"
    sha256 "494bdc87a4ed687e9a474804ad450bc6426c70d38dd09d0e40a9691881666ba0"
  end
  version "2284.0.0"
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
