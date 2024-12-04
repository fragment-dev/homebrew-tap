require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5846.0.0-darwin-x64.tar.gz"
    sha256 "92799fc1ae4a1220220b9f6776052195f5c1a85a4d20ca99ef75ad6234cff0e1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5846.0.0-darwin-arm64.tar.gz"
      sha256 "900847985482104acb5ec614ff65ee2cf503c475a09638079b24311c19b226cf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5846.0.0-linux-x64.tar.gz"
    sha256 "5c7bd78f31b550747d1a0c60af0fd38317fc00d7eb6da152ad93b0491b2f9f03"
  end
  version "5846.0.0"
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
