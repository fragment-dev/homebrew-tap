require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2938.0.0-darwin-x64.tar.gz"
    sha256 "37e89bc7707ebc13dfd7812e8611610d28a22e70b5c6d68120559be18c422ad0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2938.0.0-darwin-arm64.tar.gz"
      sha256 "e8ae8e5458e32aa221249114ed072e0e567b825ea5a99fb97819bd4f9838835d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2938.0.0-linux-x64.tar.gz"
    sha256 "3b5e99b4092b7a9d15de25d8939cab9514507438be498f05ec974aa01dea94ca"
  end
  version "2938.0.0"
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
