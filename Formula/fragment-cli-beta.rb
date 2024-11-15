require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5773.0.0-darwin-x64.tar.gz"
    sha256 "31ef052f4e2e5d9682d98901d769480ea1066ed5e21ad186b874459005301e61"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5773.0.0-darwin-arm64.tar.gz"
      sha256 "c683e739dce87011a713bf1bd9045bfac7383f7938476511cbb0b272b5944353"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5773.0.0-linux-x64.tar.gz"
    sha256 "8f14834c22675e68ff090af2392ee909acb16566b471b507b4819f82201b6f9c"
  end
  version "5773.0.0"
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
