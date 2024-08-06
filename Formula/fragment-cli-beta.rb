require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5478.0.0-darwin-x64.tar.gz"
    sha256 "45ba438e2f7c3f487f84795f93a9af54c59b164931eae229749a43320b313a11"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5478.0.0-darwin-arm64.tar.gz"
      sha256 "c03a823da5ba2b97450fd1e313d30eefa662e25ac8db3edff6fe57b40c03602d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5478.0.0-linux-x64.tar.gz"
    sha256 "675290d2ff7e841de00723dcb971158b8b32b0dbc963a827f710587777a23125"
  end
  version "5478.0.0"
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
