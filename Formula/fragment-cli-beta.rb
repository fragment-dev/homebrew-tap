require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5386.0.0-darwin-x64.tar.gz"
    sha256 "4e8709216dd8f639086c7e4b1f107d8bd77de19197a777214ec62a06ad5817a5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5386.0.0-darwin-arm64.tar.gz"
      sha256 "0b1307f613193652abac0e0b0590c9a5b0f25a44a735c4219aafa1f8f65cb7e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5386.0.0-linux-x64.tar.gz"
    sha256 "43eefe3dac52438c4efd2434c61ccdd3ffee4b6235098bf9ec8a9e9d0535f7fa"
  end
  version "5386.0.0"
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
