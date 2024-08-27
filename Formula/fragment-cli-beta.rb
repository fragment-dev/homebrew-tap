require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5544.0.0-darwin-x64.tar.gz"
    sha256 "d25d25d45358c6ced5d903ac0009d1c6cf849a7a9e033214971fb0dcaed4c297"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5544.0.0-darwin-arm64.tar.gz"
      sha256 "554547584f7e521eabae19278f6c0bb8476ca27e0f3338c06123b0abb1e4e5f5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5544.0.0-linux-x64.tar.gz"
    sha256 "c9d636292a5eaa3e8aa72111287813f42fe748c70984de3400dd6a8c1d322f59"
  end
  version "5544.0.0"
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
