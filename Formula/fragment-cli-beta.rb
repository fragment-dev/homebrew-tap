require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6092.0.0-darwin-x64.tar.gz"
    sha256 "5d37e516a4e69d61fa17b2b72c8a05a9b15169b5b05fddad9cb2434c6329051d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6092.0.0-darwin-arm64.tar.gz"
      sha256 "593f648e687ba677a2837313cc653686104b429b410004929df5d4a7391b2d7b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6092.0.0-linux-x64.tar.gz"
    sha256 "e3173e71a3240b7426e3cbd465c42077026241255271201e7f164523ba95fa5c"
  end
  version "6092.0.0"
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
