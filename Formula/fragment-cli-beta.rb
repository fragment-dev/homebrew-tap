require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4233.0.0-darwin-x64.tar.gz"
    sha256 "f109a069835d7ef332eee70b4520439026ad90ae63662dd0f58c93a39d4c8ab9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4233.0.0-darwin-arm64.tar.gz"
      sha256 "cc332e145d065c06d80ce6c529feb4cb8e948a161302521a088ea8e9a403ee91"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4233.0.0-linux-x64.tar.gz"
    sha256 "1ea62736ee8892b2df6756247941c3636985fb2ad0cf69fa5a5da051b90af112"
  end
  version "4233.0.0"
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
