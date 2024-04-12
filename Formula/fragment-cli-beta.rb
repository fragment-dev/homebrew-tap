require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4879.0.0-darwin-x64.tar.gz"
    sha256 "1da95a562d53eadc9d23254a403899ac18f45738568c29f788bf98becbf917c6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4879.0.0-darwin-arm64.tar.gz"
      sha256 "f61b18439a5323e426e9ca226afe8e33d7c2300ef8dbc69b72ca12011a2a36c9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4879.0.0-linux-x64.tar.gz"
    sha256 "38f50ce9849f67858b81b19e7329ca1de9ef274e8e8975b0737f5237db95f7fc"
  end
  version "4879.0.0"
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
