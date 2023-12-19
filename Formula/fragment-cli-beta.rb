require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4167.0.0-darwin-x64.tar.gz"
    sha256 "d5c96b120624569d1c9d90aace087dd62e75848a46476b348fa0d7e572bc7dce"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4167.0.0-darwin-arm64.tar.gz"
      sha256 "19d228e255957ae6c064d91dbfcacb046fc3751ff6429d02f5cf8bb30a8ee96c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4167.0.0-linux-x64.tar.gz"
    sha256 "dc2171c928693804cf0fe23a05d9431770c3ab5d58e11f8a1cc44cb863130114"
  end
  version "4167.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
