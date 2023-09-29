require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3715.0.0-darwin-x64.tar.gz"
    sha256 "b8b93b0ee05422d72c39b48bc7dbb62f9e3d112ac393934d42b7f2d4040dce83"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3715.0.0-darwin-arm64.tar.gz"
      sha256 "caba3de07d39808830fa48a69f9ca2fef37a86ae9794abeb3c8efe5bf26dc2c4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3715.0.0-linux-x64.tar.gz"
    sha256 "60b73323d53be9b25e3ead20e2e35f47e5519d5a9705efd51401737d5873e14a"
  end
  version "3715.0.0"
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
