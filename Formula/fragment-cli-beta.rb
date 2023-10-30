require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3932.0.0-darwin-x64.tar.gz"
    sha256 "2950a19c6f6efe771aceeb73cfc827114cdf1c6a40e2a7eb4cf8c69839c60346"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3932.0.0-darwin-arm64.tar.gz"
      sha256 "9a2b4f2c2930b122778ffe61d15d3f8b23d4dba19a2df31f9e043dc84685f7a6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3932.0.0-linux-x64.tar.gz"
    sha256 "e664ccebcd4cb72c6366d9d21775131b08e2af44a76b314eca7f990434ea2a1f"
  end
  version "3932.0.0"
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
