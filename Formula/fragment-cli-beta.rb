require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5534.0.0-darwin-x64.tar.gz"
    sha256 "030d75809aa35d120f052fff0e5fc75f88943441f1c3a892069112581f09db10"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5534.0.0-darwin-arm64.tar.gz"
      sha256 "ef0bba5ea88f9fc10b17ec99431eed9658842b3d9ded6576ebd9fbae080a92a7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5534.0.0-linux-x64.tar.gz"
    sha256 "b4b6d5f042df3851ea2a420abb5be88294a2bd87fc5b48854b372adb6c4ad57a"
  end
  version "5534.0.0"
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
