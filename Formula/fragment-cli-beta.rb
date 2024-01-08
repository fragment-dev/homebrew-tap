require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4283.0.0-darwin-x64.tar.gz"
    sha256 "3bb9cf135c559ff5608b14e5ffd685b781ac3f72f034c7d44dcdf69752ef2589"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4283.0.0-darwin-arm64.tar.gz"
      sha256 "a113f521cbfa2331f592ea30f4f2064d53665473b31bcfdca56230f9c91d008a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4283.0.0-linux-x64.tar.gz"
    sha256 "380538b1c3176888a01415ddab244924f8dbc2e98342f1fe530bc1aa0903f3ab"
  end
  version "4283.0.0"
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
