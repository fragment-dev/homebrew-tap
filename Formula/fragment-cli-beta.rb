require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5200.0.0-darwin-x64.tar.gz"
    sha256 "aeeee03d93cd940d3d32238fa1c3daf717f1a14f56660b6f1669ace368770fea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5200.0.0-darwin-arm64.tar.gz"
      sha256 "689fddbb1d2f378fa1b997d628c3c6863303ee1b1ba6503f20c0ba2f55eb4066"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5200.0.0-linux-x64.tar.gz"
    sha256 "20a4ec8873ff19d7a7f44fcbe4a0a1326f4494fca6b25f6c05dce78d4c98ab46"
  end
  version "5200.0.0"
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
