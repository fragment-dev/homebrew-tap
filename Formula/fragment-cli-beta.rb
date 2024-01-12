require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4327.0.0-darwin-x64.tar.gz"
    sha256 "47f9a93d9d526f36fab7192d7c8d124cb406d8ed50c427a285872a8eb10190ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4327.0.0-darwin-arm64.tar.gz"
      sha256 "eed10219cb90f740dd1a627ececc9c974bddc071fdbe1798c7e2ab948ac09691"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4327.0.0-linux-x64.tar.gz"
    sha256 "cfc143b60671ab4320a3b578bb45461a317ecadce5f196ecf1cec987bb928189"
  end
  version "4327.0.0"
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
