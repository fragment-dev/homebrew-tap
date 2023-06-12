require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2836.0.0-darwin-x64.tar.gz"
    sha256 "aca666f97347056d101bf7a0e4da1f9198ade51bab58fdbb51b4e41b1ea58478"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2836.0.0-darwin-arm64.tar.gz"
      sha256 "148bcebb8382eb131ceca81b68158fe98e0f8fde7b8d582f712257c4e8708d04"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2836.0.0-linux-x64.tar.gz"
    sha256 "f97ca15c56b0285ea4408f2dc48a251d814153a9325921525a976d0d1a3f4335"
  end
  version "2836.0.0"
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
