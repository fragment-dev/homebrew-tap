require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2723.0.0-darwin-x64.tar.gz"
    sha256 "ca1e0043da32fbeadd61df3b93ed0626d86ccd8235850ea3cf7e69fc3011e311"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2723.0.0-darwin-arm64.tar.gz"
      sha256 "461ded1716282df78dcadbecb9df20d3f06b963dfd81ba3354e55d192ffe60aa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2723.0.0-linux-x64.tar.gz"
    sha256 "91f81fb8923d5e7b8458c9cd66af9e0f4445a60adb6f7bfce5f7d59b88c75a34"
  end
  version "2723.0.0"
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
