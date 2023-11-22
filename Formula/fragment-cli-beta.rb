require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4037.0.0-darwin-x64.tar.gz"
    sha256 "175dc8dacfaa11854eb75259a9c70225fd7b3d0c6d264e694887fefb20f1debd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4037.0.0-darwin-arm64.tar.gz"
      sha256 "151a86a349e3d96610cd7fdb8be57659722b4255f2b4e05589861e9c3c82e0dd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4037.0.0-linux-x64.tar.gz"
    sha256 "81ccdeea564d75e705fe9f76e2db2e9237d936738ce0df6b0ecc12f59573c06f"
  end
  version "4037.0.0"
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
