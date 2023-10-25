require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3890.0.0-darwin-x64.tar.gz"
    sha256 "cb62a033528e6ee2628de44d6e61f73b377011dda52b57c8683e8a020d036ab2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3890.0.0-darwin-arm64.tar.gz"
      sha256 "fad90966e062528bc8647510225002ee6728f782e135a946a1c6f27bc90b05e5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3890.0.0-linux-x64.tar.gz"
    sha256 "c4c6271cfcf3ada4c9e15e859506ac4852c3ae4fd3780ee600269a437291f516"
  end
  version "3890.0.0"
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
