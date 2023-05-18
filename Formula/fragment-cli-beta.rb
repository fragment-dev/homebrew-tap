require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2696.0.0-darwin-x64.tar.gz"
    sha256 "c4506f9d29b17ba189db14992c81b3a412b357a273d032298861065ff4b9c1b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2696.0.0-darwin-arm64.tar.gz"
      sha256 "9c4250768980d2fd3fcdffb72098eaea5056e46c931516e32a125e2901c93fc9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2696.0.0-linux-x64.tar.gz"
    sha256 "a271bd3c3cf87282091bbbd765aa02c7eb069545c17b6e2569c1c3f69b82f35d"
  end
  version "2696.0.0"
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
