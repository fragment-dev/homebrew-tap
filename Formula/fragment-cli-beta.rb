require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5365.0.0-darwin-x64.tar.gz"
    sha256 "1b5303abdc51b9f3343af2de16cf00df28636af1e4911d7ee4afd4fe94ce60a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5365.0.0-darwin-arm64.tar.gz"
      sha256 "5dd5a0003a17b5732732e8cff7e58982ef29cd1b7c1f1282e30d7cfc5e26820c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5365.0.0-linux-x64.tar.gz"
    sha256 "71e9897aed05b0d2eec4086868423c0d68bdd9be29930b53b933681e41003051"
  end
  version "5365.0.0"
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
