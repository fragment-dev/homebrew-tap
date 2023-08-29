require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3433.0.0-darwin-x64.tar.gz"
    sha256 "84bc4688c145530d88aed60c0a2acfe317c09939fc273c0a5419227ef483fbc8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3433.0.0-darwin-arm64.tar.gz"
      sha256 "18d214cfc21bc3cfca849aa9a44680be539ca645fd5a2bba9e153049347395b9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3433.0.0-linux-x64.tar.gz"
    sha256 "d148dba76b4b304e7c30c084ffbbb52b3ccad8a14afde046dd9cb7f362deeabb"
  end
  version "3433.0.0"
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
