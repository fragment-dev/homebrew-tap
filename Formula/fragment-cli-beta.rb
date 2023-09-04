require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3476.0.0-darwin-x64.tar.gz"
    sha256 "99b221a76dd379bbe670bc4823a19664564c6cb2be1d6f9d93eb91bd0a27a494"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3476.0.0-darwin-arm64.tar.gz"
      sha256 "ef65bff8134544ce63d51542687d446cb83cc2d8ff25c34bd598718b6ec12767"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3476.0.0-linux-x64.tar.gz"
    sha256 "2b522e48d5a424c3c393c282f0f597c03b3802f13fadaf28ace2382f3ad8bb9b"
  end
  version "3476.0.0"
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
