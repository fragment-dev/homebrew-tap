require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6106.0.0-darwin-x64.tar.gz"
    sha256 "b308562ef87946c82f0e783748a459076af80837691260836e2d1a62ff3b69c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6106.0.0-darwin-arm64.tar.gz"
      sha256 "289803b15f6026e81bacfef1a6e2a9e5c1eac193a1ece81885398eab02bb39ec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6106.0.0-linux-x64.tar.gz"
    sha256 "7ad51c45a0501156e0a4a96528a7f9810335203fe3806d89e50a7c73b3958129"
  end
  version "6106.0.0"
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
