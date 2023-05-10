require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2615.0.0-darwin-x64.tar.gz"
    sha256 "fae38afc73f481887ce42423b30660a8cea65a3bb838b8b1c9ae9195ca654365"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2615.0.0-darwin-arm64.tar.gz"
      sha256 "ba37f9a637f6b968a4691f9c3da3f9c7bc8d640a78f4d19962fbeb1a933bd68b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2615.0.0-linux-x64.tar.gz"
    sha256 "d7973fbf151c9d8d6b7979c2c527bef807c79c7f34a349b890c032a09f6183bb"
  end
  version "2615.0.0"
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
