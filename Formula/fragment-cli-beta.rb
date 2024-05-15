require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5058.0.0-darwin-x64.tar.gz"
    sha256 "f98d1dbc76701dffb59ca5df37adf7c8d0be4ee75aeff248705b1d53da512fb5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5058.0.0-darwin-arm64.tar.gz"
      sha256 "5b37716054201b54b0039aa7972d2daba5a68cddd38752c2f181e7cc6a2c45ee"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5058.0.0-linux-x64.tar.gz"
    sha256 "04d63e8a0871e8664738a1ca9c31d7d55db28241542fcac31e5e7e262d92ba8f"
  end
  version "5058.0.0"
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
