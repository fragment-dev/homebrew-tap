require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5358.0.0-darwin-x64.tar.gz"
    sha256 "b692fe2b413baf0eb6e7e7b1e2e1fa3f862edaa50e6b49f7b236f316e7d3fa26"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5358.0.0-darwin-arm64.tar.gz"
      sha256 "bceeaff11bd6eba8dbf311f8f3a01fa22036fc3633f4ddd2063b4d07cec4b6e2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5358.0.0-linux-x64.tar.gz"
    sha256 "7363e89cab0c09fcfc6478ccb20c4e731d5ae3d865838e045dfb6596cdbccdf0"
  end
  version "5358.0.0"
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
