require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4361.0.0-darwin-x64.tar.gz"
    sha256 "34c2346ed4efddb9e763ca397223139db0aa8ffae2f1f416d2224411b21579b8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4361.0.0-darwin-arm64.tar.gz"
      sha256 "c00a026c8ca5cca97c026f211d94680668e9e05696542205b0f4ddbc4e318fd4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4361.0.0-linux-x64.tar.gz"
    sha256 "82bdb93caf4609d8334c28093c61d210a335793af1159d11d2051fedea2ddd0d"
  end
  version "4361.0.0"
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
