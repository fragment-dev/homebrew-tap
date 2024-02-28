require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4662.0.0-darwin-x64.tar.gz"
    sha256 "fc1cf15728ead93c7224cc82290422a1f7408cc4a04d07516a6926150ba71240"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4662.0.0-darwin-arm64.tar.gz"
      sha256 "230c00fdd6b1783d639d64b19349628eadfd9a3f2a4a75d65ed09c9900ceeef8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4662.0.0-linux-x64.tar.gz"
    sha256 "c2d64f4630f12c7febf5dae4e7ac5fe453e34af0e2b0832ac55d32b88fd1dc9b"
  end
  version "4662.0.0"
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
