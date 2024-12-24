require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5982.0.0-darwin-x64.tar.gz"
    sha256 "c61a8b2305335507b5176fe1e46eee21f1df37f077252b677f1bb9246af2bc4b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5982.0.0-darwin-arm64.tar.gz"
      sha256 "da92e348991b13b6057f22595ed827ce4fdaae983d1a992acaeb9783af8bb5b6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5982.0.0-linux-x64.tar.gz"
    sha256 "08b9223e075a8b95e14405a01ade2d2da2da48ad2712d2646420298388598dab"
  end
  version "5982.0.0"
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
