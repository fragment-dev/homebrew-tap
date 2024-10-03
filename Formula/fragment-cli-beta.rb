require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5645.0.0-darwin-x64.tar.gz"
    sha256 "b51fd042d3e32d41975d9a97ed03fbbfca607e3098d5f991d2f797faed2697cd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5645.0.0-darwin-arm64.tar.gz"
      sha256 "233dcf513256e8b0f65b322ab50deab4835c1c582d45c4a9c17d796696dc34b5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5645.0.0-linux-x64.tar.gz"
    sha256 "6e53c4a5e81a088b4cde799402febe3eb8a5b72ea34cd8448cdf27b56ab24d81"
  end
  version "5645.0.0"
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
