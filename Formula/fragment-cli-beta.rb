require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3136.0.0-darwin-x64.tar.gz"
    sha256 "9e0d79d7f568e8fd7308e2772945bd5b322af420492ba4dca9d0067c80bb0c5a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3136.0.0-darwin-arm64.tar.gz"
      sha256 "cb7f8dc6da13150674735afba77932d6cbe18e310a034426fe36fad4b5f9c7f1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3136.0.0-linux-x64.tar.gz"
    sha256 "347d72b69ef553f13e67fbff128c242afba65b801b0d6eafb45dd95abef5a327"
  end
  version "3136.0.0"
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
