require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2834.0.0-darwin-x64.tar.gz"
    sha256 "b2a9f28b99d01d641f9ea55a3e82876ee330a25fd6954501a6db58fa6d2678a6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2834.0.0-darwin-arm64.tar.gz"
      sha256 "228102481559fd705601a678be9c47d830b32995a7db6efb3584d0a89a8b1925"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2834.0.0-linux-x64.tar.gz"
    sha256 "7e71c628f09ad20429807da851d32ac9cb0e761a76004341587f1b8af1bded89"
  end
  version "2834.0.0"
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
