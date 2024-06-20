require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5302.0.0-darwin-x64.tar.gz"
    sha256 "3684867e4fb5509ecf8706f7ead0229aee44927b7a2a45fc5a758c4564fc5f8b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5302.0.0-darwin-arm64.tar.gz"
      sha256 "48e81b6a506b9310b48f2cb1f45c7eaf1e05bf8f031178faba1125139484031f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5302.0.0-linux-x64.tar.gz"
    sha256 "b17f2aced782d1b2dd60b6a0faf972df975c4b4193c3547ce21a7b9eba0e9832"
  end
  version "5302.0.0"
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
