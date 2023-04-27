require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2535.0.0-darwin-x64.tar.gz"
    sha256 "c2d071c59e1daf90b26eee8e0961515c7ded3a6b8e32a4b0660d7881ed9d0f7f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2535.0.0-darwin-arm64.tar.gz"
      sha256 "a9868fb82ebab4998b38ed68847c05f061cffc2b24da3474891881f38ffc71a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2535.0.0-linux-x64.tar.gz"
    sha256 "5f232212e7759d573f89725a4fd9f128200fed8f78b509f680ee8de697580948"
  end
  version "2535.0.0"
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
