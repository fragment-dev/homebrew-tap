require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2542.0.0-darwin-x64.tar.gz"
    sha256 "a83532539442ac4c595e53f0db1b94a7957d0eb3cc79bd54346900de44348c87"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2542.0.0-darwin-arm64.tar.gz"
      sha256 "b6793fe205ba4989b98371fb77779b413bee1d449f00a90c03be70d9cc01e1eb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2542.0.0-linux-x64.tar.gz"
    sha256 "e8c3ed9fe044346f371c49936bc4de2bb5325957ffd00b73e319864d984319a9"
  end
  version "2542.0.0"
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
