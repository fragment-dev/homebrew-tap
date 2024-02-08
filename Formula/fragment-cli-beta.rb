require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4517.0.0-darwin-x64.tar.gz"
    sha256 "932c830c45998f2e81c772e59a31b5eeab24a1eaa362e9a8a83470491fabea9f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4517.0.0-darwin-arm64.tar.gz"
      sha256 "aad520c4c588187418c19a92b9f7b16820798b6a46f741d5df9f65928779cd5e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4517.0.0-linux-x64.tar.gz"
    sha256 "cd203b0594426bfa4db31fdc0ddb2dd31a5f09b9af0b821fa924fad4b0ffb70b"
  end
  version "4517.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
