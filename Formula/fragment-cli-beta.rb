require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5285.0.0-darwin-x64.tar.gz"
    sha256 "72944f8a5f72ab36cb0505bce401c7b3d7d584b66dd142740cb597c72302ef58"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5285.0.0-darwin-arm64.tar.gz"
      sha256 "fdb8cae8c6e9e1ea045b1e1bb2ac849212badc043754e7a3de1f9904a20c53e2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5285.0.0-linux-x64.tar.gz"
    sha256 "cd7efceee34d03cff22867517f3e600db107db7627568a0d32c3f8d55b9ee63f"
  end
  version "5285.0.0"
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
