require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3391.0.0-darwin-x64.tar.gz"
    sha256 "380918c4d61c0e4cee81de293a9cd4cfeea23bc8858d45692012f16c4f463703"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3391.0.0-darwin-arm64.tar.gz"
      sha256 "a1960f7b2fd0ba78279ec3eca924adc66f67caf51eb60406f839c7fa76a10ce8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3391.0.0-linux-x64.tar.gz"
    sha256 "c1ae40d1b1ea4d7d7d7e60d05da9518b4a8ab8a0079c7a0c49fb7a24f3e26925"
  end
  version "3391.0.0"
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
