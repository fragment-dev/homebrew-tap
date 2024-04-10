require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4866.0.0-darwin-x64.tar.gz"
    sha256 "d6fcec7224311929ed7bec11b2bcae66ec29e5a69d44ff559a26511d958619dc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4866.0.0-darwin-arm64.tar.gz"
      sha256 "d643c6cc9845938f17f96fb7d72e2953839c584b478a32194453a5e83bf67302"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4866.0.0-linux-x64.tar.gz"
    sha256 "94289817f894c2b94418de46d7eb1907dbb6b3dcea5f7fc2fdf19a77ff480750"
  end
  version "4866.0.0"
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
