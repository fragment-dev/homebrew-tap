require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5617.0.0-darwin-x64.tar.gz"
    sha256 "9952f5a1ba29cf1b0883abc37979716fb555cb17f8b74c8fe62dc29deb2a00bf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5617.0.0-darwin-arm64.tar.gz"
      sha256 "83b37ea89eb7386a6200e17ab859ac50fd359bd117288a71312ae05ab44b0fb7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5617.0.0-linux-x64.tar.gz"
    sha256 "905b3a0b7748e7db0a89beae7144b1c985b64093d40bebd12ceab08a70c86b0f"
  end
  version "5617.0.0"
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
