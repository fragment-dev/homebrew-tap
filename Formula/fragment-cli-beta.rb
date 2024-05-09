require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5023.0.0-darwin-x64.tar.gz"
    sha256 "42ce200794c5a8e70336964fb2bd8e64151f35d765a792b0396c10d21fe1db5f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5023.0.0-darwin-arm64.tar.gz"
      sha256 "25f66c19b4259882bed8ec78482716460dd7c40d2c33096076c37255186b4037"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5023.0.0-linux-x64.tar.gz"
    sha256 "cb6b97a2c16da8557f77f89b7170f9ba3ec8263c553cbfa0b4a02f99232fec34"
  end
  version "5023.0.0"
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
