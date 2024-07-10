require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5375.0.0-darwin-x64.tar.gz"
    sha256 "22f536ef6fe053bc1f866f8934309cfc2708149170d700a235638c5269add155"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5375.0.0-darwin-arm64.tar.gz"
      sha256 "88b8e0bf7e85ec2536dd959179b6554d96678b1da7686182184b810e10f58f6c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5375.0.0-linux-x64.tar.gz"
    sha256 "de34b43a5419e988e344a7e2711a8d2a3099e7cf13fcd9c159603cf61e81458f"
  end
  version "5375.0.0"
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
