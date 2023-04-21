require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2497.0.0-darwin-x64.tar.gz"
    sha256 "8383509aee9eb932328d5f88194a5434536b4bf2566cdec21c5507617c69861e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2497.0.0-darwin-arm64.tar.gz"
      sha256 "4bd96c8c7ae893ea29974fca151f9384cb908705846ab5e2a1b30e599034fe68"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2497.0.0-linux-x64.tar.gz"
    sha256 "2ba4c38e5eaa020cc082c4ba35f9276cf4a2963e4c732c7d9cd5a75f3422648b"
  end
  version "2497.0.0"
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
