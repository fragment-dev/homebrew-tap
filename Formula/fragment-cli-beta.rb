require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2298.0.0-darwin-x64.tar.gz"
    sha256 "2dd32147994102784b37918be485868ab6d1d1d4cd56ae3bb7746cb49bff6cf9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2298.0.0-darwin-arm64.tar.gz"
      sha256 "b32532db1f73ac633a1d9a5f3454ba7f872264fee47d445d9fa6fbb50cf96f9c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2298.0.0-linux-x64.tar.gz"
    sha256 "78e57eaa041a539bd4d9cde965a97ae2a30afdf3d998f1a07a64ba775cfcec0f"
  end
  version "2298.0.0"
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
