require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2763.0.0-darwin-x64.tar.gz"
    sha256 "9ae89a6dad283a9df7a4173f5ee4c5046250fff8d9a1e857436854d535584d63"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2763.0.0-darwin-arm64.tar.gz"
      sha256 "82005dbfc241be4111614f8793144c1ee07cb0b8a9b14f93d53024714d9c75d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2763.0.0-linux-x64.tar.gz"
    sha256 "56801dc8f1dde36c74280a9dd7162ca7cd8fdfd7f6670854ccaf9e77273b1ab3"
  end
  version "2763.0.0"
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
