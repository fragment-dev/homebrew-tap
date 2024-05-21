require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5098.0.0-darwin-x64.tar.gz"
    sha256 "3c0145cc8705a6d86f7a8c40a164e17ddd102b740bac3fd7a62d056a299500b8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5098.0.0-darwin-arm64.tar.gz"
      sha256 "5589eb3fccd694040cea620471c01fa452a0d15775d737a37f9a39bc948c4927"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5098.0.0-linux-x64.tar.gz"
    sha256 "f315f0b3d2acfae27e7c7504a611d9959a30922e5447675d8dc7d722b49ad925"
  end
  version "5098.0.0"
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
